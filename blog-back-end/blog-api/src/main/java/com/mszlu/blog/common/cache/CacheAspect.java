package com.mszlu.blog.common.cache;

import com.alibaba.fastjson.JSON;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.mszlu.blog.vo.Result;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.codec.digest.DigestUtils;
import org.apache.commons.lang3.StringUtils;
import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.Signature;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Pointcut;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.annotation.AliasFor;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.data.redis.core.StringRedisTemplate;
import org.springframework.stereotype.Component;

import javax.servlet.http.HttpServletResponse;
import java.lang.reflect.Method;
import java.time.Duration;
//aop 定义一个切面，切面定义了切点和通知的关系
@Aspect
@Component
@Slf4j
public class CacheAspect {

    private static final ObjectMapper objectMapper = new ObjectMapper();


    @Autowired
    private RedisTemplate<String, String> redisTemplate;

    @Pointcut("@annotation(com.mszlu.blog.common.cache.Cache)")
    public void pt(){}

    @Around("pt()")
    public Object around(ProceedingJoinPoint pjp){
        try {
            Signature signature = pjp.getSignature();

            String className = pjp.getTarget().getClass().getSimpleName();

            String methodName = signature.getName();


            Class[] parameterTypes = new Class[pjp.getArgs().length];
            Object[] args = pjp.getArgs();
            //参数
            String params = "";
            for(int i=0; i<args.length; i++) {
                if(args[i] != null) {
                    params += JSON.toJSONString(args[i]);
                    parameterTypes[i] = args[i].getClass();
                }else {
                    parameterTypes[i] = null;
                }
            }
            if (StringUtils.isNotEmpty(params)) {

                params = DigestUtils.md5Hex(params);
            }
            Method method = pjp.getSignature().getDeclaringType().getMethod(methodName, parameterTypes);

            Cache annotation = method.getAnnotation(Cache.class);

            long expire = annotation.expire();

            String name = annotation.name();

            String redisKey = name + "::" + className+"::"+methodName+"::"+params;
            String redisValue = redisTemplate.opsForValue().get(redisKey);
            if (StringUtils.isNotEmpty(redisValue)){
                log.info("Cache End~~,{}",redisKey);
                Result result = JSON.parseObject(redisValue, Result.class);
                return result;
            }
            Object proceed = pjp.proceed();
            redisTemplate.opsForValue().set(redisKey,JSON.toJSONString(proceed), Duration.ofMillis(expire));
            log.info("Store in cache~~~ {},{}",className,methodName);
            return proceed;
        } catch (Throwable throwable) {
            throwable.printStackTrace();
        }
        return Result.fail(-999,"系统错误");
    }

}
