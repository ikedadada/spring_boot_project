# プロジェクトの始め方

1. コンテナを作成してログインする

```terminal
$ docker-compose build
$ docker-compose up -d
$ docker-compose exec spring sh
```

2. spring-initializer でプロジェクトを作成する

```terminal(in-container)
$ /spring-3.2.1/bin/spring init --type=gradle-project-kotlin --java-version=21 --dependencies=web --packaging=jar sampleapp.zip
```

（各指定は良しなに）
ref: https://docs.spring.io/spring-boot/docs/current/reference/html/cli.html#cli.using-the-cli.initialize-new-project

※ https://start.spring.io/ で Project ファイルをもってくるなら 1~2 の工程はいらない

3. 作成したファイルを解凍

```
$ unzip sampleapp.zip
$ rm sampleapp.zip
```

4. Spring Web のサンプルコードを記載

```./src/main/java/com/example/sampleapp/DemoApplication.java
package com.example.demo;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

@SpringBootApplication
@RestController
public class DemoApplication {
    public static void main(String[] args) {
      SpringApplication.run(DemoApplication.class, args);
    }
    @GetMapping("/hello")
    public String hello(@RequestParam(value = "name", defaultValue = "World") String name) {
      return String.format("Hello %s!", name);
    }
}
```

ref: https://spring.pleiades.io/quickstart

5. SampleApp の実行

```
$ ./gradlew bootRun
```

@see http:/localhost:8080/hello
