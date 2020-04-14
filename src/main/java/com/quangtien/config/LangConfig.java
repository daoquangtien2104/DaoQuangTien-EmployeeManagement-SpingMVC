package com.quangtien.config;

import org.springframework.context.MessageSource;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.support.ReloadableResourceBundleMessageSource;
import org.springframework.web.servlet.LocaleResolver;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;
import org.springframework.web.servlet.i18n.CookieLocaleResolver;
import org.springframework.web.servlet.i18n.LocaleChangeInterceptor;

@Configuration
public class LangConfig  implements WebMvcConfigurer
{
	@Bean(name = "localeResolver")
    public LocaleResolver getLocalResolver()
    {
        CookieLocaleResolver localeResolver = new CookieLocaleResolver();
        localeResolver.setCookieName("lang");
        localeResolver.setCookieMaxAge(60 * 60 * 24 * 30);
        return localeResolver;
    }

    @Bean(name = "messageSource")
    public MessageSource getMessageSource()
    {
        ReloadableResourceBundleMessageSource messageSource = new ReloadableResourceBundleMessageSource();

        messageSource.setBasename("/lang/language");
        messageSource.setDefaultEncoding("UTF-8");
        return messageSource;
    }
    
    public void addInterceptors(InterceptorRegistry registry) 
    {
    	System.out.println("da vao addInter");
    	LocaleChangeInterceptor localInterceptor = new LocaleChangeInterceptor();
    	localInterceptor.setParamName("lang");
    	registry.addInterceptor(localInterceptor);
    }
}
