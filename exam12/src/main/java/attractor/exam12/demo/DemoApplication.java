package attractor.exam12.demo;

import attractor.exam12.demo.controller.Controller;
import attractor.exam12.demo.service.Service;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.ComponentScan;

@SpringBootApplication
@ComponentScan(basePackageClasses= Controller.class)
@ComponentScan(basePackageClasses= Service.class)
public class DemoApplication {

    public static void main(String[] args) {
        SpringApplication.run(DemoApplication.class, args);
    }

}
