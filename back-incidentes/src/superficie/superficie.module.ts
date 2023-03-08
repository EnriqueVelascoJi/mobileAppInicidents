import { Module } from '@nestjs/common';
import { SuperficieController } from './superficie.controller';
import { SuperficieService } from './superficie.service';

@Module({
  controllers: [SuperficieController],
  providers: [SuperficieService]
})
export class SuperficieModule {}
