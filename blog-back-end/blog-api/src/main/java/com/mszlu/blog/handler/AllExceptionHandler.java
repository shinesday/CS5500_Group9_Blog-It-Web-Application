package com.mszlu.blog.handler;

import com.mszlu.blog.vo.Result;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ResponseBody;

//对加了@Controller注解的方法进行拦截处理 AOP的实现
//Intercepting methods annotated with @Controller, AOP implementation
@ControllerAdvice
public class AllExceptionHandler {
    //进行异常处理，处理Exception.class的异常
    // handle the exception of Exception.class
    @ExceptionHandler(Exception.class)
    @ResponseBody //return json data
    public Result doException(Exception ex){
        ex.printStackTrace();
        return Result.fail(-999,"System error");
    }

}
