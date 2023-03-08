import { Module } from '@nestjs/common';
import { LocalidadController } from './localidad.controller';
import { LocalidadService } from './localidad.service';

@Module({
  controllers: [LocalidadController],
  providers: [LocalidadService]
})
export class LocalidadModule {}
