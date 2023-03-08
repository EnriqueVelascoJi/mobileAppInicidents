import { Module } from '@nestjs/common';
import { TipoIncidenteService } from './tipo-incidente.service';
import { TipoIncidenteController } from './tipo-incidente.controller';

@Module({
  providers: [TipoIncidenteService],
  controllers: [TipoIncidenteController]
})
export class TipoIncidenteModule {}
