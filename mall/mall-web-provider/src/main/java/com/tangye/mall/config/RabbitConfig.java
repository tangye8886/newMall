package com.tangye.mall.config;
import org.springframework.amqp.core.Binding;
import org.springframework.amqp.core.BindingBuilder;
import org.springframework.amqp.core.Exchange;
import org.springframework.amqp.core.ExchangeBuilder;
import org.springframework.amqp.core.Queue;
import org.springframework.amqp.rabbit.connection.CachingConnectionFactory;
import org.springframework.amqp.rabbit.connection.ConnectionFactory;
import org.springframework.amqp.rabbit.core.RabbitTemplate;
import org.springframework.amqp.support.converter.Jackson2JsonMessageConverter;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.beans.factory.config.ConfigurableBeanFactory;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.Scope;

@Configuration
public class RabbitConfig {
	
	 	@Value("${spring.rabbitmq.host}")
	    private String host;
	    @Value("${spring.rabbitmq.port}")
	    private int port;
	    @Value("${spring.rabbitmq.username}")
	    private String username;
	    @Value("${spring.rabbitmq.password}")
	    private String password;
	
	    public static final String QUEUE_NAME="mall_springboot_queue";
		public static final String EXCHANGE_NAME="mall_springboot_exchange";
		public static final String ROUNTER_KEY="inform.email";
		public static final String EXCHANGE_TYPE="exchange_topic";
	    
	    @Bean
	    public ConnectionFactory connectionFactory() {
	        CachingConnectionFactory connectionFactory = new CachingConnectionFactory(host,port);
	        connectionFactory.setUsername(username);
	        connectionFactory.setPassword(password);
	        connectionFactory.setVirtualHost("/");
	        connectionFactory.setPublisherConfirms(true);
	        return connectionFactory;
	    }
	    
	    @Bean
        @Scope(ConfigurableBeanFactory.SCOPE_PROTOTYPE)
        // 必须是prototype类型,不然每次回调都是最后一个内容
        public RabbitTemplate rabbitTemplate(ConnectionFactory connectionFactory) {
            RabbitTemplate template = new RabbitTemplate(connectionFactory);
            template.setMessageConverter(new Jackson2JsonMessageConverter());// 发送端类型转化pojo,需要序列化
            return template;
        }

	    
	    
	  //声明队列
		@Bean(QUEUE_NAME)
		public Queue getQueue()
		{
			return new Queue(QUEUE_NAME);
		}
		
		//声明交换机
		@Bean(EXCHANGE_NAME)
		public Exchange getExChange()
		{
			return ExchangeBuilder.topicExchange(EXCHANGE_NAME).durable(true).build();
		}
		
		//绑定交换机和队列
		@Bean
		public Binding binding(@Qualifier(QUEUE_NAME)Queue queue,@Qualifier(EXCHANGE_NAME) Exchange exchange)
		{
			return BindingBuilder.bind(queue).to(exchange).with(ROUNTER_KEY).noargs();
		}
}
