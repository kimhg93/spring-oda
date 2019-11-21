package kr.co.oda.config;

import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.EnableAspectJAutoProxy;
import org.springframework.context.annotation.Import;

import kr.co.oda.config.app.MyBatisConfig;

@Configuration
@EnableAspectJAutoProxy
@ComponentScan({"kr.co.oda.repository, kr.co.oda.service, kr.co.oda.security"})
@Import({MyBatisConfig.class})
public class AppConfig {
	
}
