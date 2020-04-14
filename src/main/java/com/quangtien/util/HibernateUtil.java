package com.quangtien.util;

import java.util.Properties;

import org.hibernate.SessionFactory;
import org.hibernate.boot.Metadata;
import org.hibernate.boot.MetadataSources;
import org.hibernate.boot.registry.StandardServiceRegistry;
import org.hibernate.boot.registry.StandardServiceRegistryBuilder;
import org.hibernate.cfg.Environment;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

import com.quangtien.model.Depart;
import com.quangtien.model.Staffs;

public class HibernateUtil 
{
	SessionFactory sessionFactory;
	StandardServiceRegistry registry;
	
	@Bean("factory")
	public SessionFactory getSessionFactory()
	{
		if (sessionFactory == null)
		{
			StandardServiceRegistryBuilder registryBuilder = new StandardServiceRegistryBuilder();
			Properties settings = new Properties();
			settings.put(Environment.USER, "sa");
			settings.put(Environment.PASS, "123");
			settings.put(Environment.DRIVER, "com.microsoft.sqlserver.jdbc.SQLServerDriver");
			settings.put(Environment.DIALECT, "org.hibernate.dialect.SQLServerDialect");
			settings.put(Environment.SHOW_SQL, true);
			registryBuilder.applySettings(settings);
			
			MetadataSources metadataSources = new MetadataSources(registry);
			metadataSources.addAnnotatedClass(Depart.class)
							.addAnnotatedClass(Staffs.class);
			
			Metadata metadata = metadataSources.buildMetadata();
			
			sessionFactory = metadata.buildSessionFactory();
			
		}
		System.out.println("bulild");
		return sessionFactory;
	}
}
