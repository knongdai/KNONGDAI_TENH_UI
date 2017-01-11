package com.knongdai.tinh.configuration.security;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.PropertySource;
import org.springframework.core.env.Environment;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.http.converter.StringHttpMessageConverter;
import org.springframework.http.converter.json.MappingJackson2HttpMessageConverter;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.servlet.config.annotation.CorsRegistry;

@Configuration
@PropertySource(
		value={"classpath:configuration.properties"}
)
public class WebRestConfiguration {
	@Autowired
	Environment environment;
	@Bean(name="header")
	public HttpHeaders header(){
		HttpHeaders header=new HttpHeaders();
		header.setContentType(MediaType.APPLICATION_JSON);
		String apiUrl ="ZGV2OiFAI2FwaQ==";
		header.set("Authorization","Basic "+apiUrl);
		return header;
	}
	
	@Bean
	public RestTemplate restTemplate(){
		RestTemplate restTemplate = new RestTemplate();
		restTemplate.getMessageConverters().add(new MappingJackson2HttpMessageConverter());
		restTemplate.getMessageConverters().add(new StringHttpMessageConverter());
		return restTemplate;
	}
	@Bean
	public String WS_URL(){
		return	environment.getProperty("PHSARNET.API.URL");		
	}
	@Bean
	public String WEB_URL(){
		return environment.getProperty("PHSARNET.URL");
	}
	@Bean
	public String KEY_HEADER(){
		return environment.getProperty("PHSARNET.API.SERECT_HEADER");
	}
	
	
	
}
