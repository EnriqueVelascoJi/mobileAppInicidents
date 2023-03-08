import { Module } from '@nestjs/common';
import { ModoTransporteController } from './modo-transporte.controller';
import { ModoTransporteService } from './modo-transporte.service';

@Module({
  controllers: [ModoTransporteController],
  providers: [ModoTransporteService]
})
export class ModoTransporteModule {}
