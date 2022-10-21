/*
 Navicat Premium Data Transfer

 Source Server         : test
 Source Server Type    : MySQL
 Source Server Version : 80020
 Source Host           : localhost:3306
 Source Schema         : blog

 Target Server Type    : MySQL
 Target Server Version : 80020
 File Encoding         : 65001

 Date: 21/06/2021 22:42:03
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for ms_admin
-- ----------------------------
DROP TABLE IF EXISTS `ms_admin`;
CREATE TABLE `ms_admin`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ms_admin
-- ----------------------------
INSERT INTO `ms_admin` VALUES (1, 'admin', '$2a$10$RZECQ90DjOT/t1mhnXsl5.XSuZWc0Sa1XduPxj2rb4yaSYcje3nWW');
INSERT INTO `ms_admin` VALUES (2, 'mszlu', '$2a$10$RZECQ90DjOT/t1mhnXsl5.XSuZWc0Sa1XduPxj2rb4yaSYcje3nWW');

-- ----------------------------
-- Table structure for ms_admin_permission
-- ----------------------------
DROP TABLE IF EXISTS `ms_admin_permission`;
CREATE TABLE `ms_admin_permission`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT,
  `admin_id` bigint(0) NOT NULL,
  `permission_id` bigint(0) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ms_admin_permission
-- ----------------------------
INSERT INTO `ms_admin_permission` VALUES (1, 1, 1);
INSERT INTO `ms_admin_permission` VALUES (2, 2, 1);

-- ----------------------------
-- Table structure for ms_article
-- ----------------------------
DROP TABLE IF EXISTS `ms_article`;
CREATE TABLE `ms_article`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT,
  `comment_counts` int(0) NULL DEFAULT NULL COMMENT 'the number of comments',
  `create_date` bigint(0) NULL DEFAULT NULL COMMENT 'the date of creation',
  `summary` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'Introduction',
  `title` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'Title',
  `view_counts` int(0) NULL DEFAULT NULL COMMENT 'the number of views',
  `weight` int(0) NOT NULL COMMENT 'the weight',
  `author_id` bigint(0) NULL DEFAULT NULL COMMENT 'author id',
  `body_id` bigint(0) NULL DEFAULT NULL COMMENT 'content id',
  `category_id` int(0) NULL DEFAULT NULL COMMENT 'category id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1405916999732707331 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ms_article
-- ----------------------------
INSERT INTO `ms_article` VALUES (1, 1, 1621947720727, 'The service implemented by Spring Boot only needs to rely on a Java class, package it into a jar, and run it through the `java -jar` command. \r\n\r\nCompared to traditional Spring applications, all this has become very lightweight and simple.', 'Springboot introduction and introductory case', 125, 0, 1, 1, 2);
INSERT INTO `ms_article` VALUES (9, 0, 1613947720727, 'Vue (pronounced /vjuː/, similar to view) is a progressive framework for building user interfaces.', 'What exactly is Vue.js ?', 3, 0, 1, 20, 2);
INSERT INTO `ms_article` VALUES (10, 0, 1523947720727, 'This section describes how to use Element in your project.', 'Element related', 10, 0, 1, 21, 2);
INSERT INTO `ms_article` VALUES (1405564731300831233, 0, 1623947720727, '66666666666', '666666666666666', 2, 0, 1, 1405564731351162882, 2);
INSERT INTO `ms_article` VALUES (1405909844724051969, 0, 1624030002164, '123', '123123', 2, 0, 1, 1405909844828909569, 3);
INSERT INTO `ms_article` VALUES (1405916999732707330, 0, 1624031708047, 'Springboot introductory case', 'SpringBoot introductory case', 5, 0, 1, 1405916999854342146, 2);

-- ----------------------------
-- Table structure for ms_article_body
-- ----------------------------
DROP TABLE IF EXISTS `ms_article_body`;
CREATE TABLE `ms_article_body`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT,
  `content` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `content_html` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `article_id` bigint(0) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `article_id`(`article_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1405916999854342147 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ms_article_body
-- ----------------------------
INSERT INTO `ms_article_body` VALUES (1, '# 1. Introduction to Spring Boot\r\n\r\n## 1.1 Introduction\r\n\r\nWhen you first contacted and learned the Spring framework, did you retreat because of its complicated configuration? \r\n\r\nWhen you use the Spring framework for the nth time, do you feel a little bored with a bunch of configurations that are pasted repeatedly? \r\n\r\nThen you might as well try using Spring Boot to make it easier for you to get started and build Spring applications more easily and quickly! \r\n\r\nSpring Boot makes our Spring applications lighter. \r\n\r\nWe don''t have to build the project, package the application, and deploy it to Tomcat and other application servers to run our business services as before. \r\n\r\nThe service implemented by Spring Boot only needs to rely on a Java class, package it into a jar, and run it through the `java -jar` command. \r\n\r\nCompared to traditional Spring applications, all this has become very lightweight and simple. \r\n\r\n**To summarize the main advantages of Spring Boot:**\r\n\r\n1. Faster entry for all Spring developers\r\n2. A default configuration to simplify project configuration\r\n3. Embedded containers simplify web projects\r\n4. No redundant code generation and XML configuration requirements\r\n5. Unified dependency management\r\n6. Autowiring , easier to use, easier to extend\r\n\r\n## 1.2 Use release notes\r\n\r\nSpringboot version: use the latest 2.5.0 version\r\n\r\nThe tutorial refers to the official documentation Make it, authoritative. \r\n\r\nOther dependency versions:\r\n\r\n 1. Maven requirements: 3.5+\r\n\r\n 2. JDK requirements 8+\r\n 3. Spring Framework 5.3 .7 and above\r\n 4. Tomcat 9.0\r\n 5. Servlet version 4.0 but can be deployed to Servlet to 3.1+ containers\r\n\r\n# 2. Quick Start\r\n\ r\nQuickly create a Spring Boot application and implement a simple Http request processing. Through this example, I have a preliminary understanding of Spring Boot, and experience its simple structure and rapid development characteristics. \r\n\r\nThe version of Idea used in the tutorial: 2019.3\r\n\r\n## 2.1 Create a basic project\r\n\r\n**The first step:** Create a maven project\r \n\r\npom.xml :\r\n\r\n~~~xml\r\n<?xml version=\"1.0\" encoding=\"UTF-8\"?>\r\n <project xmlns=\"http://maven.apache.org/POM/4.0.0\"\r\n xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" \r\n xsi:schemaLocation=\"http://maven.apache.org/POM/4.0.0 http://maven.apache.org/xsd/maven-4.0.0.xsd\">\r\ n <modelVersion>4.0.0</modelVersion>\r\n\r\n <groupId>com.xiaopizhu</groupId>\r\n <artifactId>helloSpringBoot</artifactId>\r\n <version>1.0- SNAPSHOT</version>\r\n <!--springboot''s parent project defines common dependencies and has no dependency conflicts -->\r\n <parent>\r\n <groupId>org.springframework.boot </groupId>\r\n <artifactId>spring-boot-starter-parent</artifactId>\r\n <version>2.5.0</version>\r\n </parent>\r\n</ project>\r\n~~~\r\n\r\nNote that the parent above must be added, which defines the n multiple dependencies officially supported by springboot. Basically, the commonly used ones are already there, so when importing the dependencies next , most of them can be without the version number. \r\n\r\nThe project structure at this time is:\r\n\r\n![image-20210523173241557](img/image-20210523173241557.png)\r\n\r\n**Second Step:** Add web dependencies\r\n\r\n~~~xml\r\n<dependencies>\r\n <dependency>\r\n <groupId>org.springframework.boot</groupId>\ r\n <artifactId>spring-boot-starter-web</artifactId>\r\n </dependency>\r\n</dependencies>\r\n~~~\r\n\r\nAdd above web dependencies, which indirectly depend on spring and springmvc packages such as spring-web, spring-webmvc, spring-core, etc., and integrate tomcat. \r\n\r\n**Step 3:** Write the startup class\r\n\r\n~~~java\r\npackage com.xiaopizhu.springboot;\r\n\r\nimport org .springframework.boot.SpringApplication;\r\nimport org.springframework.boot.autoconfigure.SpringBootApplication;\r\n\r\n@SpringBootApplication\r\npublic class HelloApp {\r\n\r\n public static void main (String[] args) {\r\n SpringApplication.run(HelloApp.class,args);\r\n }\r\n}\r\n\r\n~~~\r\n\r\ The n@SpringBootApplication annotation identifies HelloApp as the startup class, which is also the core of Spring Boot. \r\n\r\n**Step 4:** Run the main method of the startup class\r\n\r\n![image-20210523173712142](img/image-20210523173712142.png)\r\n\ r\nSee the above configuration, which proves that the startup is successful. The default tomcat port number is 8080. \r\n\r\n**Step 5:** If you want to modify the port number, you can create a new application.properties\r\n\r\n~~~properties\r\nserver.port in the resources directory =8082\r\n~~~\r\n\r\n**Step 6:** Rerun\r\n\r\n![image-20210523174011613](img/image-20210523174011613.png) \r\n\r\nThe project structure at this time is:\r\n\r\n![image-20210523174032053](img/image-20210523174032053.png)\r\n\r\n**src/ main/java :** Write java code, note that the startup class needs to be placed under the root package of the project. \r\n\r\n**src/main/resources:** The directory where resources are placed, such as springboot configuration files, static files, mybatis configuration, log configuration, etc. \r\n\r\n**src/test/java:** Test code\r\n\r\n## 2.2 Write an Http interface\r\n\r\n**First step:* *Create a `HelloController` class with the following content:\r\n\r\n~~~java\r\npackage com.xiaopizhu.springboot.controller;\r\n\r\nimport org.springframework.web.bind. annotation.GetMapping;\r\nimport org.springframework.web.bind.annotation.RequestMapping;\r\nimport org.springframework.web.bind.annotation.RestController;\r\n\r\n@RestController\r\n @RequestMapping(\"hello\")\r\npublic class HelloController {\r\n\r\n @GetMapping(\"boot\")\r\n public String hello(){\r\n return \" hello spring boot\";\r\n }\r\n\r\n}\r\n\r\n~~~\r\n\r\n**Pay attention to the package name, it must be where the startup class is located under the package name. **\r\n\r\n** Step 2:** Restart the program, use postman or directly enter http://localhost:8082/hello/boot\r\n\r\n to get the result :hello spring boot\r\n\r\n## 2.3 Writing unit test cases\r\n\r\n**The first step:**Adding spring boot test dependencies\r\n\r\n~~ ~xml\r\n <dependency>\r\n <groupId>org.springframework.boot</groupId>\r\n <artifactId>spring-boot-starter-test</artifactId>\r\n <scope> test</scope>\r\n </dependency>\r\n~~~\r\n\r\n**Step 2:**Under src/test, write test cases\r\n\ r\n~~~java\r\npackage com.xiaopizhu.springboot.controller;\r\n\r\nimport org.junit.jupiter.api.BeforeAll;\r\nimport org.junit.jupiter.api.BeforeEach ;\r\nimport org.junit.jupiter.api.Test;\r\nimport org.springframework.boot.test.context.SpringBootTest;\r\nimport org.springframework.http.MediaType;\r\nimport org.springframework .test.web.servlet.MockMvc;\r\nimport org.springframework.test.web.servlet.request.MockMvcRequestBuilders;\r\nimport org.springframework.test.web.servlet.setup.MockMvcBuilders;\r\n\ r\nimport static org.hamcrest.Matchers.equalTo;\r\nimport static org.sp ringframework.test.web.servlet.result.MockMvcResultMatchers.content;\r\nimport static org.springframework.test.web.servlet.result.MockMvcResultMatche', 1);
INSERT INTO `ms_article_body` VALUES (20, 'Vue (pronounced /vjuː/, similar to view) is a progressive framework for building user interfaces. Unlike other large frameworks, Vue is designed to be applied layer by layer from the bottom up. Vue''s core library only focuses on the view layer, which is not only easy to use, but also easy to integrate with third-party libraries or existing projects. On the other hand, when combined with modern toolchains and various supporting libraries, Vue is also fully capable of powering complex single-page applications. \n\nIf you want to learn more about Vue before diving into it, we''ve made a video that walks you through its core concepts and an example project. \nIf you are already an experienced front-end developer and want to know the difference between Vue and other libraries/frameworks, please see Compare other frameworks. \n\n# Getting Started\n\n> The official guide assumes an intermediate knowledge of HTML, CSS and JavaScript. If you''re just starting out with front-end development, using a framework as your first step might not be the best idea - master the basics and come back! Previous experience with other frameworks is helpful, but not required. \n\nThe easiest way to try Vue.js is to use the Hello World example on JSFiddle. You can open it in a new tab of your browser and follow the examples to learn some basic usage. Or you can create a .html file and import Vue as follows:\n\n```javascript\n<script src=\"https://cdn.jsdelivr.net/npm/vue\">< /script>\n\n```\nInstallation tutorial gives more ways to install Vue. Please note that we do not recommend using vue-cli directly for newbies, especially if you are new to Node.js based build tools. \n\n# Declarative rendering\nThe core of Vue.js is a system that allows declarative rendering of data into the DOM using a concise template syntax:\n```javascript\n<div id=\"app\ ">\n {{ message }}\n</div>\n\n```\n```javascript\nvar app = new Vue({\n el: \'#app\',\n data : {\n message: \'Hello Vue!\'\n }\n})\n\n```\nWe have successfully created our first Vue app! It looks very similar to rendering a string template, but Vue does a lot of work behind the scenes. Now that the data and the DOM are associated, everything is reactive. How can we be sure? Open your browser''s JavaScript console (which opens on this page), and modify the value of app.message , and you''ll see the example above update accordingly. \n\nIn addition to text interpolation, we can also bind element properties like this:\n\n\n\n\n\n\n', '<p>Vue (pronounced /vjuː/, similar to view) is a progressive framework for building user interfaces. Unlike other large frameworks, Vue is designed to be applied layer by layer from the bottom up. Vue''s core library only focuses on the view layer, which is not only easy to use, but also easy to integrate with third-party libraries or existing projects. On the other hand, when combined with modern toolchains and various supporting libraries, Vue is also fully capable of powering complex single-page applications. </p>\n<p>If you want to learn more about Vue before diving into it, we''ve made a video that walks you through its core concepts and an example project. <br />\nIf you are already an experienced front-end developer and want to know the difference between Vue and other libraries/frameworks, please see Compare other frameworks. </p>\n<h1>Getting Started</h1>\n<blockquote>\n<p>The official guide assumes an intermediate knowledge of HTML, CSS and JavaScript. If you''re just starting out with front-end development, using a framework as your first step might not be the best idea - master the basics and come back! Previous experience with other frameworks is helpful, but not required. </p>\n</blockquote>\n<p>The easiest way to try Vue.js is to use the Hello World example on JSFiddle. You can open it in a new tab of your browser and follow the examples to learn some basic usage. Or you can create a .html file and import Vue as follows: </p>\n<pre><div class=\"hljs\"><code class=\"lang-javascript\">&lt; script src=<span class=\"hljs-string\">\"https://cdn.jsdelivr.net/npm/vue\"</span>&gt;<span class=\"xml\"><span class=\"hljs-tag\">&lt;/<span class=\"hljs-name\">script</span>&gt;</span></span>\n\n</code></span> div></pre>\n<p>The installation tutorial gives more ways to install Vue. Please note that we do not recommend using vue-cli directly for newbies, especially if you are new to Node.js based build tools. </p>\n<h1>Declarative rendering</h1>\n<p>The core of Vue.js is a system that allows declarative rendering of data into the DOM using a concise template syntax:</p> \n<pre><div class=\"hljs\"><code class=\"lang-javascript\">&lt;div id=<span class=\"hljs-string\">\"app\"< /span>&gt;\n {{ message }}\n&lt;<span class=\"hljs-regexp\">/div&gt;\n\n</span></code></div></pre> \n<pre><div class=\"hljs\"><code class=\"lang-javascript\"><span class=\"hljs-keyword\">var</span> app = <span class= \"hljs-keyword\">new</span> Vue({\n <span class=\"hljs-attr\">el</span>: <span class=\"hljs-string\">\' #app\'</span>,\n <span class=\"hljs-attr\">data</span>: {\n <span class=\"hljs-attr\">message</span>: <span class=\"hljs-string\">\'Hello Vue!\'</span>\n }\n})\n\n</code></div></pre>\n<p > We have successfully created our first Vue app! It looks very similar to rendering a string template, but Vue does a lot of work behind the scenes. Now that the data and the DOM are associated, everything is reactive. How can we be sure? Open your browser''s JavaScript console (which opens on this page), and modify the value of app.message , and you''ll see the example above update accordingly. </p>\n<p>In addition to text interpolation, we can also bind element properties like this:</p>\n', 9);
INSERT INTO `ms_article_body` VALUES (21, '## Quick Start\n\nThis section describes how to use Element in your projects. \n\n### Using Starter Kit\nWe provide generic project templates that you can use directly. For Laravel users, we have also prepared corresponding templates, which can also be downloaded and used directly. \n\nIf you don''t want to use the template we provide, please read on. \n\n### Using vue-cli\n\nWe can also use vue-cli to initialize the project, the command is as follows:\n\n```language\n> npm i -g vue-cli\n> mkdir my-project && cd my-project\n> vue init webpack\n> npm i && npm i element-ui\n```\n\n### Import Element\nYou can import the entire Element, or according to Only some components need to be imported. Let''s first introduce how to introduce a complete Element. \n\n#### Complete import\nWrite the following in main.js:\n```javascript\nimport Vue from \'vue\'\nimport ElementUI from \'element-ui\'\nimport \'element-ui/lib/theme-chalk/index.css\'\nimport App from \'./App.vue\'\n\nVue.use(ElementUI)\n\nnew Vue({\n el: \'#app\',\n render: h => h(App)\n})\n\n```\nThe above code completes the introduction of Element. It should be noted that the style file needs to be imported separately. \n\n#### Import on demand\nWith babel-plugin-component, we can only import the required components to reduce the size of the project. \n\nFirst, install the babel-plugin-component:\n\n', '<h2>Getting Started</h2>\n<p>This section describes how to use Element in your project. </p>\n<h3>Using the Starter Kit</h3>\n<p>We provide generic project templates that you can use directly. For Laravel users, we have also prepared corresponding templates, which can also be downloaded and used directly. </p>\n<p>If you don''t want to use the templates we provide, please read on. </p>\n<h3>Use vue-cli</h3>\n<p>We can also use vue-cli to initialize the project, the command is as follows:</p>\n<pre><code class=\" lang-language\">&gt; npm i -g vue-cli\n&gt; mkdir my-project &amp;&amp; cd my-project\n&gt; vue init webpack\n&gt; npm i &amp;&amp; npm i element-ui \n</code></pre>\n<h3>Import Element</h3>\n<p>You can import the entire Element, or only some components as needed. Let''s first introduce how to introduce a complete Element. </p>\n<h4>Full import</h4>\n<p>Write the following in main.js:</p>\n<pre><div class=\"hljs\">< code class=\"lang-javascript\"><span class=\"hljs-keyword\">import</span> Vue <span class=\"hljs-keyword\">from</span> <span class= \"hljs-string\">\'vue\'</span>\n<span class=\"hljs-keyword\">import</span> ElementUI <span class=\"hljs-keyword\">from </span> <span class=\"hljs-string\">\'element-ui\'</span>\n<span class=\"hljs-keyword\">import</span> <span class= \"hljs-string\">\'element-ui/lib/theme-chalk/index.css\'</span>\n<span class=\"hljs-keyword\">import</span> App < span class=\"hljs-keyword\">from</span> <span class=\"hljs-string\">\'./App.vue\'</span>\n\nVue.use(ElementUI) \n\n<span class=\"hljs-keyword\">new</span> Vue({\n <span class=\"hljs-attr\">el</span>: <span class=\" hljs-string\">\'#app\'</span>,\n <span class=\"hljs-attr\">render</span>: <span class=\"hljs-function\">< span class=\"hljs-params\">h</span> =&gt;</span> h(App)\n})\n\n</code></div></pre>\n< p> The above code completes the introduction of Element. It should be noted that the style file needs to be imported separately. </p>\n<h4>Introduce on demand</h4>\n<p>With the help of babel-plugin-component, we can only import the required components to reduce the size of the project. </p>\n<p>First, install the babel-plugin-component:</p>\n', 10);
INSERT INTO `ms_article_body` VALUES (1405564731351162882, '666666666666', '<p>666666666666</p>\n', 1405564731300831233);
INSERT INTO `ms_article_body` VALUES (1405909844828909569, '# 1. Introduction to Spring Boot\n\n## 1.1 Introduction\n\nWhen you first contacted and learned the Spring framework, did you retreat because of its complicated configuration? \n\nWhen you use the Spring framework for the nth time, do you feel a little bored with a bunch of configurations that are pasted repeatedly? \n\nThen you might as well try using Spring Boot to make it easier for you to get started and build Spring applications more simply and quickly! \n\nSpring Boot makes our Spring applications lighter. \n\nWe don''t have to build the project, package the application, and deploy it to the application server such as Tomcat to run our business service as before. \n\nThe service implemented by Spring Boot only needs to rely on a Java class, package it into a jar, and run it through the `java -jar` command. \n\nCompared to traditional Spring applications, all this has become very lightweight and simple. \n\n**To summarize the main advantages of Spring Boot:**\n\n1. Faster entry for all Spring developers\n2. Out of the box, various default configurations are provided to simplify project configuration\n3. Embedded containers simplify web projects\n4. No redundant code generation and XML configuration requirements\n5. Unified dependency management\n6. Autowiring, easier to use, easier to extend\n\n## 1.2 Use release notes\n \nSpringboot version: Use the latest version 2.5.0\n\nThe tutorial refers to the official documentation for production, authoritative. \n\nOther dependent versions:\n\n 1. Maven requirements: 3.5+\n\n 2. JDK requirements 8+\n 3. Spring Framework 5.3.7 or above\n 4. Tomcat 9.0\n 5. Servlet version 4.0 but can be deployed to Servlet to 3.1+ containers\n\n# 2. Quick Start\n\nQuickly create a Spring Boot application and implement a simple Http request processing. Through this example, I have a preliminary understanding of Spring Boot, and experience its simple structure and rapid development characteristics. \n\nThe Idea version used in the tutorial: 2019.3\n\n## 2.1 Create a basic project\n\n**The first step:** Create a maven project\n\npom.xml :\n\n~~~ xml\n<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<project xmlns=\"http://maven.apache.org/POM/4.0.0\"\ n xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\"\n xsi:schemaLocation=\"http://maven.apache.org/POM/4.0.0 http:/ /maven.apache.org/xsd/maven-4.0.0.xsd\">\n <modelVersion>4.0.0</modelVersion>\n\n <groupId>com.xiaopizhu</groupId>\n <artifactId> helloSpringBoot</artifactId>\n <version>1.0-SNAPSHOT</version>\n <!--springboot''s parent project defines common dependencies and has no dependency conflicts -->\n <parent>\n <groupId >org.springframework.boot</groupId>\n <artifactId>spring-boot-starter-parent</artifactId>\n <version>2.5.0</version>\n </parent>\n</project> \n~~~\n\nNote that the parent above must be added, which defines the n multi-dependencies officially supported by springboot. Basically, the commonly used ones are already there, so when importing dependencies, most of them can be omitted. version number. \n\nThe project structure at this time is:\n\n![image20210523173241557.png](https://static.mszlu.com/6fc39758-0db2-431d-9f94-a705aa2c7e59.png)\n\n** Step 2: ** Add web dependencies\n\n~~~xml\n<dependencies>\n <dependency>\n <groupId>org.springframework.boot</groupId>\n <artifactId>spring-boot- starter-web</artifactId>\n </dependency>\n</dependencies>\n~~~\n\nAdd the web dependencies above, which indirectly depend on spring-web, spring-webmvc, spring-core, etc. Spring and springmvc packages, and integrated tomcat. \n\n**Step 3:** Write the startup class\n\n~~~java\npackage com.xiaopizhu.springboot;\n\nimport org.springframework.boot.SpringApplication;\nimport org.springframework.boot .autoconfigure.SpringBootApplication;\n\n@SpringBootApplication\npublic class HelloApp {\n\n public static void main(String[] args) {\n SpringApplication.run(HelloApp.class,args);\n }\n} \n\n~~~\n\nThe @SpringBootApplication annotation identifies HelloApp as the startup class and is also the core of Spring Boot. \n\n**Step 4:** Run the main method of the startup class\n\n![image-20210523173712142](img/image-20210523173712142.png)\n\nSee the above configuration, which proves that the startup is successful. The tomcat port number is 8080 by default. \n\n**Step 5:** If you want to modify the port number, you can create a new application.properties in the resources directory\n\n~~~properties\nserver.port=8082\n~~~\n\ n**Step 6:** Rerun\n\n![image-20210523174011613](img/image-20210523174011613.png)\n\nThe project structure at this time is:\n\n![image-20210523174032053 ](img/image-20210523174032053.png)\n\n**src/main/java :** Write java code, note that the startup class needs to be placed in the root package of the project. \n\n**src/main/resources:** The directory where resources are placed, such as springboot configuration files, static files, mybatis configuration, log configuration, etc. \n\n**src/test/java:** Test code\n\n## 2.2 Write an Http interface\n\n**The first step:** Create the `HelloController` class, the content is as follows:\n \n~~~java\npackage com.xiaopizhu.springboot.controller;\n\nimport org.springframework.web.bind.annotation.GetMapping;\nimport org.springframework.web.bind.annotation.RequestMapping;\nimport org. springframework.web.bind.annotation.RestController;\n\n@RestController\n@RequestMapping(\"hello\")\npublic class HelloController {\n\n @GetMapping(\"boot\")\n public String hello (){\n return \"hello spring boot\";\n }\n\n}\n\n~~~\n\n**Note the package name, it must be under the package name where the startup class is located. **\n\n** Step 2: ** Restart the program, use postman or directly enter http://localhost:8082/hello/boot\n\n in the browser to get the result: hello spring boot\n\n ## 2.3 Write unit test cases\n\n**The first step: ** Add spring boot test dependencies\n\n~~~xml\n <dependency>\n <groupId>org.springframework.boot</groupId >\n <artifactId>spring-boot-starter-test</artifactId>\n <scope>test</scope>\n </dependency>\n~~~\n\n**Step 2:** Under src/test, write test cases\n\n~~~java\npackage com.xiaopizhu.springboot.controller;\n\nimport org.junit.jupiter.api.BeforeAll;\nimport org.junit.jupiter.api .BeforeEach;\nimport org.junit.jupiter.api.Test;\nimport org.springframework.boot.test.context.SpringBootTest;\nimport org.springframework.http.MediaType;\nimport org.springframework.test.web.servlet .MockMvc;\nimport org.springframework.test.web.servlet.request.MockMvcRequestBuilders;\nimport org.springframework.test.web.servlet.setup.MockMvcBuilders;\n\nimport static org.hamcrest.Matchers.equalTo;\nimport static org.springframework.test.web.servlet.result.MockMvcResultMatchers.c ontent;\nimport static org.springframework.test.web.servlet.result.MockMvcResultMatchers.status;\n\n@SpringBootTest\npublic class TestHelloController {\n\n private MockMvc mockMvc;\n\n @BeforeEach\n public void beforeEach(){\n mockMvc = MockMvcBuilders.standaloneSetup(new HelloController()).build();\n }\n @Test\n public void testHello() throws Exception {\n mockMvc.perform(MockMvcRequestBuilders.get', 1405909844724051969);
INSERT INTO `ms_article_body` VALUES (1405916999854342146, '# 1. Introduction to Spring Boot\n\n## 1.1 Introduction\n\nWhen you first contacted and learned the Spring framework, did you retreat because of its complicated configuration? \n\nWhen you use the Spring framework for the nth time, do you feel a little bored with a bunch of configurations that are pasted repeatedly? \n\nThen you might as well try using Spring Boot to make it easier for you to get started and build Spring applications more simply and quickly! \n\nSpring Boot makes our Spring applications lighter. \n\nWe don''t have to build the project, package the application, and deploy it to the application server such as Tomcat to run our business service as before. \n\nThe service implemented by Spring Boot only needs to rely on a Java class, package it into a jar, and run it through the `java -jar` command. \n\nCompared to traditional Spring applications, all this has become very lightweight and simple. \n\n**To summarize the main advantages of Spring Boot:**\n\n1. Faster entry for all Spring developers\n2. Out of the box, various default configurations are provided to simplify project configuration\n3. Embedded containers simplify web projects\n4. No redundant code generation and XML configuration requirements\n5. Unified dependency management\n6. Autowiring, easier to use, easier to extend\n\n## 1.2 Use release notes\n \nSpringboot version: Use the latest version 2.5.0\n\nThe tutorial refers to the official documentation for production, authoritative. \n\nOther dependent versions:\n\n 1. Maven requirements: 3.5+\n\n 2. JDK requirements 8+\n 3. Spring Framework 5.3.7 or above\n 4. Tomcat 9.0\n 5. Servlet version 4.0 but can be deployed to Servlet to 3.1+ containers\n\n# 2. Quick Start\n\nQuickly create a Spring Boot application and implement a simple Http request processing. Through this example, I have a preliminary understanding of Spring Boot, and experience its simple structure and rapid development characteristics. \n\nThe Idea version used in the tutorial: 2019.3\n\n## 2.1 Create a basic project\n\n**The first step:** Create a maven project\n\npom.xml :\n\n~~~ xml\n<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<project xmlns=\"http://maven.apache.org/POM/4.0.0\"\ n xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\"\n xsi:schemaLocation=\"http://maven.apache.org/POM/4.0.0 http:/ /maven.apache.org/xsd/maven-4.0.0.xsd\">\n <modelVersion>4.0.0</modelVersion>\n\n <groupId>com.xiaopizhu</groupId>\n <artifactId> helloSpringBoot</artifactId>\n <version>1.0-SNAPSHOT</version>\n <!--springboot''s parent project defines common dependencies and has no dependency conflicts -->\n <parent>\n <groupId >org.springframework.boot</groupId>\n <artifactId>spring-boot-starter-parent</artifactId>\n <version>2.5.0</version>\n </parent>\n</project> \n~~~\n\nNote that the parent above must be added, which defines the n multi-dependencies officially supported by springboot. Basically, the commonly used ones are already there, so when importing dependencies, most of them can be omitted. version number. \n\nThe project structure at this time is:\n\n![image20210523173241557.png](https://static.mszlu.com/a7302c88-e106-46ad-9713-dc9a6d523957.png)\n\n** Step 2: ** Add web dependencies\n\n~~~xml\n<dependencies>\n <dependency>\n <groupId>org.springframework.boot</groupId>\n <artifactId>spring-boot- starter-web</artifactId>\n </dependency>\n</dependencies>\n~~~\n\nAdd the web dependencies above, which indirectly depend on spring-web, spring-webmvc, spring-core, etc. Spring and springmvc packages, and integrated tomcat. \n\n**Step 3:** Write the startup class\n\n~~~java\npackage com.xiaopizhu.springboot;\n\nimport org.springframework.boot.SpringApplication;\nimport org.springframework.boot .autoconfigure.SpringBootApplication;\n\n@SpringBootApplication\npublic class HelloApp {\n\n public static void main(String[] args) {\n SpringApplication.run(HelloApp.class,args);\n }\n} \n\n~~~\n\nThe @SpringBootApplication annotation identifies HelloApp as the startup class and is also the core of Spring Boot. \n\n**Step 4:** Run the main method of the startup class\n\n![image20210523173712142.png](https://static.mszlu.com/dc17b43e-08df-46b0-bb7a-eb73044de7da.png )\n\nSee the above configuration, which proves that the startup is successful. The default tomcat port number is 8080. \n\n**Step 5:** If you want to modify the port number, you can create a new application.properties in the resources directory\n\n~~~properties\nserver.port=8082\n~~~\n\ n**Step 6:** Rerun\n\n![image20210523174011613.png](https://static.mszlu.com/318e4b7e-95d2-4e43-a18f-279ea6ff9495.png)\n\nAt this time The project structure is:\n\n![image20210523174032053.png](https://static.mszlu.com/756e4ae0-c4c7-43a5-9b5d-bc7ce974a942.png)\n\n**src/main/java : ** Write java code, note that the startup class needs to be placed under the root package of the project. \n\n**src/main/resources:** The directory where resources are placed, such as springboot configuration files, static files, mybatis configuration, log configuration, etc. \n\n**src/test/java:** Test code\n\n## 2.2 Write an Http interface\n\n**The first step:** Create the `HelloController` class, the content is as follows:\n \n~~~java\npackage com.xiaopizhu.springboot.controller;\n\nimport org.springframework.web.bind.annotation.GetMapping;\nimport org.springframework.web.bind.annotation.RequestMapping;\nimport org. springframework.web.bind.annotation.RestController;\n\n@RestController\n@RequestMapping(\"hello\")\npublic class HelloController {\n\n @GetMapping(\"boot\")\n public String hello (){\n return \"hello spring boot\";\n }\n\n}\n\n~~~\n\n**Note the package name, it must be under the package name where the startup class is located. **\n\n** Step 2: ** Restart the program, use postman or directly enter http://localhost:8082/hello/boot\n\n in the browser to get the result: hello spring boot\n\n ## 2.3 Write unit test cases\n\n**The first step: ** Add spring boot test dependencies\n\n~~~xml\n <dependency>\n <groupId>org.springframework.boot</groupId >\n <artifactId>spring-boot-starter-test</artifactId>\n <scope>test</scope>\n </dependency>\n~~~\n\n**Step 2:** Under src/test, write test cases\n\n~~~java\npackage com.xiaopizhu.springboot.controller;\n\nimport org.junit.jupiter.api.BeforeAll;\nimport org.junit.jupiter.api .BeforeEach;\nimport org.junit.jupiter.api.Test;\nimport org.springframework.boot.test.context.SpringBootTest;\nimport org.springframework.http.MediaType;\nimport org.springframework.test.web.servlet .MockMvc;\nimport org.springframework.test.web.servlet.request.MockMvcRequestBuilders;\nimport org.springframework.test.web.servlet.setup.MockMvcBuilders;\n\nimport static org.hamcrest.Matchers.equalTo;\nimport static org.springframework.test.web.servlet.result.MockMvcResultMatchers.c ontent;\nimport static org.springframework.test.web.servlet.result.MockMvcResultMatchers.status;\n\n@SpringBootTest\npublic class TestHelloController {\n\n private MockMvc mockMvc;\n\n @BeforeEach\n public void beforeEach(){\n mockMvc = MockMvcBuilders.standaloneSetup(new HelloController()).build();\n }', 1405916999732707330);

-- ----------------------------
-- Table structure for ms_article_tag
-- ----------------------------
DROP TABLE IF EXISTS `ms_article_tag`;
CREATE TABLE `ms_article_tag`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT,
  `article_id` bigint(0) NOT NULL,
  `tag_id` bigint(0) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `article_id`(`article_id`) USING BTREE,
  INDEX `tag_id`(`tag_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1405916999787233282 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ms_article_tag
-- ----------------------------
INSERT INTO `ms_article_tag` VALUES (1, 1, 7);
INSERT INTO `ms_article_tag` VALUES (2, 1, 5);
INSERT INTO `ms_article_tag` VALUES (3, 1, 8);
INSERT INTO `ms_article_tag` VALUES (4, 9, 7);
INSERT INTO `ms_article_tag` VALUES (5, 10, 7);
INSERT INTO `ms_article_tag` VALUES (6, 10, 8);
INSERT INTO `ms_article_tag` VALUES (7, 10, 5);
INSERT INTO `ms_article_tag` VALUES (8, 10, 6);
INSERT INTO `ms_article_tag` VALUES (1405564731321802753, 1405564731300831233, 5);
INSERT INTO `ms_article_tag` VALUES (1405909844761800706, 1405909844724051969, 5);
INSERT INTO `ms_article_tag` VALUES (1405916999787233281, 1405916999732707330, 5);

-- ----------------------------
-- Table structure for ms_category
-- ----------------------------
DROP TABLE IF EXISTS `ms_category`;
CREATE TABLE `ms_category`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT,
  `avatar` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `category_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ms_category
-- ----------------------------
INSERT INTO `ms_category` VALUES (1, '/static/category/front.png', 'Frontend', 'What is the front end, the big front end');
INSERT INTO `ms_category` VALUES (2, '/static/category/back.png', 'Backend', 'The backend is the most important');
INSERT INTO `ms_category` VALUES (3, '/static/category/lift.jpg', 'Daily life', 'daily life story');
INSERT INTO `ms_category` VALUES (4, '/static/category/database.png', 'Database', 'Database is the most basic');
INSERT INTO `ms_category` VALUES (5, '/static/category/language.png', 'Programming Language', 'Which programming lanuage?');

-- ----------------------------
-- Table structure for ms_comment
-- ----------------------------
DROP TABLE IF EXISTS `ms_comment`;
CREATE TABLE `ms_comment`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT,
  `content` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `create_date` bigint(0) NOT NULL,
  `article_id` int(0) NOT NULL,
  `author_id` bigint(0) NOT NULL,
  `parent_id` bigint(0) NOT NULL,
  `to_uid` bigint(0) NOT NULL,
  `level` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `article_id`(`article_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1405209691876790275 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ms_comment
-- ----------------------------
INSERT INTO `ms_comment` VALUES (53, '写的好', 123213213213, 1, 1, 0, 1, '1');
INSERT INTO `ms_comment` VALUES (54, '111', 123123123123, 1, 1, 53, 1, '2');
INSERT INTO `ms_comment` VALUES (56, '222', 12312, 1, 1, 0, 1, '1');
INSERT INTO `ms_comment` VALUES (1405204547248377858, '123', 1623861846172, 1, 1, 53, 1, '2');
INSERT INTO `ms_comment` VALUES (1405205050975899650, '123123', 1623861966270, 1, 1, 0, 0, '1');
INSERT INTO `ms_comment` VALUES (1405205572185280513, '3333', 1623862090534, 1, 1, 0, 0, '1');
INSERT INTO `ms_comment` VALUES (1405206087392612353, '7777', 1623862213367, 1, 1, 0, 0, '1');
INSERT INTO `ms_comment` VALUES (1405206147568291842, '7777', 1623862227714, 1, 1, 0, 0, '1');
INSERT INTO `ms_comment` VALUES (1405206347246522370, '666', 1623862275315, 1, 1, 0, 0, '1');
INSERT INTO `ms_comment` VALUES (1405208637198131202, '99999999999999999999', 1623862821278, 1, 1, 0, 0, '1');
INSERT INTO `ms_comment` VALUES (1405209691876790274, '66666666666666666', 1623863072732, 1, 1, 1405208637198131202, 1, '2');

-- ----------------------------
-- Table structure for ms_permission
-- ----------------------------
DROP TABLE IF EXISTS `ms_permission`;
CREATE TABLE `ms_permission`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `path` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ms_permission
-- ----------------------------
INSERT INTO `ms_permission` VALUES (1, 'checkPermission', '/admin/permission/permissionList', 'checkPermission');
INSERT INTO `ms_permission` VALUES (2, '11', '11', '111');
INSERT INTO `ms_permission` VALUES (7, '1213', '123', '123');
INSERT INTO `ms_permission` VALUES (8, 'deletePermission', '/admin/permission/add', 'deletePermission');

-- ----------------------------
-- Table structure for ms_sys_log
-- ----------------------------
DROP TABLE IF EXISTS `ms_sys_log`;
CREATE TABLE `ms_sys_log`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT,
  `create_date` bigint(0) NULL DEFAULT NULL,
  `ip` varchar(15) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `method` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `module` varchar(10) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `nickname` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `operation` varchar(25) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `params` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `time` bigint(0) NULL DEFAULT NULL,
  `userid` bigint(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ms_sys_log
-- ----------------------------

-- ----------------------------
-- Table structure for ms_sys_user
-- ----------------------------
DROP TABLE IF EXISTS `ms_sys_user`;
CREATE TABLE `ms_sys_user`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT,
  `account` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'account',
  `admin` bit(1) NULL DEFAULT NULL COMMENT 'ifAdmin',
  `avatar` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'avatar',
  `create_date` bigint(0) NULL DEFAULT NULL COMMENT 'registration time',
  `deleted` bit(1) NULL DEFAULT NULL COMMENT 'deleted',
  `email` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'mail box',
  `last_login` bigint(0) NULL DEFAULT NULL COMMENT 'final login time',
  `mobile_phone_number` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'mobile_phone_number',
  `nickname` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'nickname',
  `password` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'password',
  `salt` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'salt',
  `status` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'status',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1404448588146192387 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ms_sys_user
-- ----------------------------
INSERT INTO `ms_sys_user` VALUES (1, 'admin', b'1', 'http://localhost:8080/static/img/logo.b3a48c0.png', 20210622223122, b'0', '11', 20210630223130, '12', '李四', '15f08f86435b060236fa9ccea751e9e5', '12', '1');
INSERT INTO `ms_sys_user` VALUES (1404446129264832513, 'lisi', b'1', '/static/img/logo.b3a48c0.png', 1623681025218, b'0', '', 1623681025218, NULL, '李四', '1d01d52c40f4ff57ad3f93a06daf21d5', '', '');
INSERT INTO `ms_sys_user` VALUES (1404448463944462338, '12213', b'1', '/static/img/logo.b3a48c0.png', 1623681581855, b'0', '', 1623681581855, NULL, '123', '8628d1f407f72e10ac947a032fe5ad29', '', '');
INSERT INTO `ms_sys_user` VALUES (1404448588146192386, '123', b'1', '/static/img/logo.b3a48c0.png', 1623681611474, b'0', '', 1623681611474, NULL, '123', '5e112646dbf3570f8e23d0cf1027ede1', '', '');

-- ----------------------------
-- Table structure for ms_tag
-- ----------------------------
DROP TABLE IF EXISTS `ms_tag`;
CREATE TABLE `ms_tag`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT,
  `avatar` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `tag_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ms_tag
-- ----------------------------
INSERT INTO `ms_tag` VALUES (5, '/static/tag/java.png', 'springboot');
INSERT INTO `ms_tag` VALUES (6, '/static/tag/java.png', 'spring');
INSERT INTO `ms_tag` VALUES (7, '/static/tag/java.png', 'springmvc');
INSERT INTO `ms_tag` VALUES (8, '/static/tag/css.png', '11');

SET FOREIGN_KEY_CHECKS = 1;
