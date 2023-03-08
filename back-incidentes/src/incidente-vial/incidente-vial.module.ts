import { Module } from '@nestjs/common';
import { IncidenteVialController } from './incidente-vial.controller';
import { IncidenteVialService } from './incidente-vial.service';

@Module({
  controllers: [IncidenteVialController],
  providers: [IncidenteVialService]
})
export class IncidenteVialModule {}
