import { Module } from '@nestjs/common';
import { CodesService } from './codes.service';
import { CodesController } from './codes.controller';
import { UserModule } from '../user/user.module';
import { TypeOrmModule } from '@nestjs/typeorm';
import { CodeEntity } from './codes.entity';

@Module({
  imports: [TypeOrmModule.forFeature([CodeEntity]), UserModule],
  controllers: [CodesController],
  providers: [CodesService],
})
export class CodesModule {}
