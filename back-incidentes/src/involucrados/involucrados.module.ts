import { Module } from '@nestjs/common';
import { InvolucradosController } from './involucrados.controller';
import { InvolucradosService } from './involucrados.service';

@Module({
  controllers: [InvolucradosController],
  providers: [InvolucradosService]
})
export class InvolucradosModule {}
