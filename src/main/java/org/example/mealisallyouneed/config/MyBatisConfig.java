package org.example.mealisallyouneed.config;

import io.github.cdimascio.dotenv.Dotenv;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import java.io.IOException;
import java.io.InputStream;
import java.util.Properties;


public class MyBatisConfig {
    private static final SqlSessionFactory sqlSessionFactory;

    static {
        // dotenv 로드
        Dotenv dotenv = Dotenv.configure().ignoreIfMissing().load();

        // 환경변수
        Properties properties = new Properties();
        properties.setProperty("DB_DRIVER", dotenv.get("DB_DRIVER"));
        properties.setProperty("DB_URL", dotenv.get("DB_URL"));
        properties.setProperty("DB_USERNAME", dotenv.get("DB_USERNAME"));
        properties.setProperty("DB_PASSWORD", dotenv.get("DB_PASSWORD"));

        // mybatis-config.xml 파일 로드
        String resource = "mybatis-config.xml";
        // 등록 안해도 코드에서 찾아요 (resource 에 등록 안해도 수동으로 찾는 코드)
        try (InputStream inputStream = MyBatisConfig.class.getClassLoader().getResourceAsStream(resource)) {
            // 연결...
            sqlSessionFactory = new SqlSessionFactoryBuilder().build(inputStream, properties);
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }

    // 일종의 싱글톤으로 봐야하는데...
    public static SqlSessionFactory getSqlSessionFactory() {
        return sqlSessionFactory;
    }
}
