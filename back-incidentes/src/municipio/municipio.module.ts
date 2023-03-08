import { Module } from '@nestjs/common';
import { MunicipioController } from './municipio.controller';
import { MunicipioService } from './municipio.service';

@Module({
  controllers: [MunicipioController],
  providers: [MunicipioService]
})
export class MunicipioModule {}
