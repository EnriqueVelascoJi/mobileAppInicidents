import { Module } from '@nestjs/common';
import { PlacasTransporteController } from './placas-transporte.controller';
import { PlacasTransporteService } from './placas-transporte.service';

@Module({
  controllers: [PlacasTransporteController],
  providers: [PlacasTransporteService]
})
export class PlacasTransporteModule {}
