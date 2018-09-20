package io.sciro.config;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.client.discovery.EnableDiscoveryClient;
import org.springframework.cloud.config.server.EnableConfigServer;

/**
 * PROJECT   : config
 * PACKAGE   : io.sciro.config
 * USER      : sean
 * DATE      : 17-Mon-Sep-2018
 * TIME      : 14:47
 * E-MAIL    : kudzai@bcs.org
 * CELL      : +27-64-906-8809
 */
@SpringBootApplication
@EnableConfigServer
@EnableDiscoveryClient
public class SpringConfigApp {
    public static void main(String[] args) {
        SpringApplication.run(SpringConfigApp.class, args);
    }
}
