import { Module } from '@nestjs/common';
import { TypeOrmModule } from '@nestjs/typeorm';
import { AppController } from './app.controller';
import { AppService } from './app.service';
import { config } from 'dotenv';
import { UserModule } from './app/user/user.module';
import { UserEntity } from './app/user/user.entity';
import { CodesModule } from './app/codes/codes.module';
import { AdministratorModule } from './app/administrator/administrator.module';
import { AgentModule } from './app/agent/agent.module';
import { CodeEntity } from './app/codes/codes.entity';
import { AgentEntity } from './app/agent/agent.entity';
import { AdministratorEntity } from './app/administrator/administrator.entity';
config();
const { DB_HOST, DB_PORT, DB_USER, DB_PASSWORD } = process.env;

@Module({
  imports: [
    TypeOrmModule.forRoot({
      type: 'mariadb',
      host: DB_HOST,
      port: Number.parseInt(DB_PORT),
      username: DB_USER,
      password: DB_PASSWORD,
      synchronize: true,
      entities: [UserEntity, CodeEntity, AgentEntity, AdministratorEntity], //usar esta para crear la migración desde local
      database: 'test',
    }),
    UserModule,
    CodesModule,
    AdministratorModule,
    AgentModule,
  ],
  controllers: [AppController],
  providers: [AppService],
})
export class AppModule {}
