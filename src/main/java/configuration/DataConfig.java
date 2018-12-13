package configuration;

import java.util.Properties;

import javax.annotation.Resource;
import javax.sql.DataSource;

import org.hibernate.jpa.HibernatePersistenceProvider;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.PropertySource;
import org.springframework.core.env.Environment;
import org.springframework.data.jpa.repository.config.EnableJpaRepositories;
import org.springframework.jdbc.datasource.DriverManagerDataSource;
import org.springframework.orm.jpa.JpaTransactionManager;
import org.springframework.orm.jpa.LocalContainerEntityManagerFactoryBean;
import org.springframework.transaction.annotation.EnableTransactionManagement;

@Configuration
@EnableJpaRepositories("data.repositories")
@EnableTransactionManagement
@ComponentScan("data.services")
@PropertySource("classpath:db.properties")
public class DataConfig {
	
	private static final String DB_DRIVER = "db.driver";
	private static final String DB_URL = "db.url";
	private static final String DB_USER = "db.user";
	private static final String DB_PASSWORD = "db.password";
	private static final String DB_HIBERNATE_DIALECT = "db.hibernate.dialect";
	private static final String DB_HIBERNATE_SHOW_SQL = "db.hibernate.show_sql";
	private static final String DB_ENTITYMANAGER_PACKAGES_TO_SCAN = "db.entitymanager.packages.to.scan";
	private static final String DB_HIBERNATE_HBM2DDL_AUTO = "db.hibernate.hbm2ddl.auto";
	
	private static final String DB_HIBERNATE_DEFAULT_SCHEMA = "db.hibernate.default_schema";

	@Resource
	Environment env;

	@Bean
	public DataSource dataSource() {
		DriverManagerDataSource dataSource = new DriverManagerDataSource();
		dataSource.setDriverClassName(env.getRequiredProperty(DB_DRIVER));
		dataSource.setUrl(env.getRequiredProperty(DB_URL));
		dataSource.setUsername(env.getRequiredProperty(DB_USER));
		dataSource.setPassword(env.getRequiredProperty(DB_PASSWORD));
		return dataSource;
	}

	@Bean
	public LocalContainerEntityManagerFactoryBean entityManagerFactory() {
		LocalContainerEntityManagerFactoryBean factory = new LocalContainerEntityManagerFactoryBean();
		factory.setDataSource(dataSource());
		factory.setJpaProperties(getHibernateProperties());
		factory.setPackagesToScan(env.getRequiredProperty(DB_ENTITYMANAGER_PACKAGES_TO_SCAN));
		factory.setPersistenceProviderClass(HibernatePersistenceProvider.class);
		return factory;
	}

	@Bean
	public JpaTransactionManager transactionManager() {
		JpaTransactionManager manager = new JpaTransactionManager();
		manager.setEntityManagerFactory(entityManagerFactory().getObject());
		return manager;
	}

	private Properties getHibernateProperties() {
		Properties properties = new Properties();
		properties.put(DB_HIBERNATE_DIALECT, env.getRequiredProperty(DB_HIBERNATE_DIALECT));
		properties.put(DB_HIBERNATE_HBM2DDL_AUTO, env.getRequiredProperty(DB_HIBERNATE_HBM2DDL_AUTO));
		properties.put(DB_HIBERNATE_SHOW_SQL, env.getRequiredProperty(DB_HIBERNATE_SHOW_SQL));
		properties.put(DB_HIBERNATE_DEFAULT_SCHEMA, env.getRequiredProperty(DB_HIBERNATE_DEFAULT_SCHEMA));
		return properties;
	}
}
