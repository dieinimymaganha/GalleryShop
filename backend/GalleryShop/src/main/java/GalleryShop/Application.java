package GalleryShop;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cache.annotation.EnableCaching;
import org.springframework.data.web.config.EnableSpringDataWebSupport;

import springfox.documentation.swagger2.annotations.EnableSwagger2;

import javax.servlet.Filter;
import org.springframework.context.annotation.Bean;
import org.springframework.web.filter.CharacterEncodingFilter;


@SpringBootApplication 
@EnableSpringDataWebSupport
@EnableCaching
@EnableSwagger2
public class Application {

	public static void main(String[] args) {
		SpringApplication.run(Application.class, args);
	}

	@Bean
	public Filter getCharacterEncodingFilter() {
	
		CharacterEncodingFilter encodingFilter = new CharacterEncodingFilter();
	
		encodingFilter.setEncoding("UTF-8");
		encodingFilter.setForceEncoding(true);
	
		return encodingFilter;
	
	}



}


