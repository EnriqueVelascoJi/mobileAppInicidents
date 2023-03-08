import { Module } from '@nestjs/common';
import { AppController } from './app.controller';
import { AppService } from './app.service';
import { TypeOrmModule } from '@nestjs/typeorm'; 
import { RepuveModule } from './repuve/repuve.module';
import { RepuveController } from './repuve/repuve.controller';
import { RepuveService } from './repuve/repuve.service';
import { UsuariosModule } from './usuarios/usuarios.module';
import { InvolucradosModule } from './involucrados/involucrados.module';
import { IncidenteVialModule } from './incidente-vial/incidente-vial.module';
import { UbicacionModule } from './ubicacion/ubicacion.module';
import { SuperficieModule } from './superficie/superficie.module';
import { LocalidadModule } from './localidad/localidad.module';
import { MunicipioModule } from './municipio/municipio.module';
import { PlacasTransporteModule } from './placas-transporte/placas-transporte.module';
import { ModoTransporteModule } from './modo-transporte/modo-transporte.module';
import { TipoIncidenteModule } from './tipo-incidente/tipo-incidente.module';

@Module({
  imports: [
    TypeOrmModule.forRoot({
      type: 'mysql',
      host: 'localhost', 
      port: 3306,
      username: 'root',
      password: 'password',
      database: 'incidentesViales',
      entities: [__dirname + '/**/*.entity{.ts.js}']

    }),
    RepuveModule,
    UsuariosModule,
    InvolucradosModule,
    IncidenteVialModule,
    UbicacionModule,
    SuperficieModule,
    LocalidadModule,
    MunicipioModule,
    PlacasTransporteModule,
    ModoTransporteModule,
    TipoIncidenteModule

  ],
  controllers: [AppController, RepuveController],
  providers: [AppService, RepuveService],
})
export class AppModule {}
