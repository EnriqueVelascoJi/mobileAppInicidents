import { Module } from '@nestjs/common';
import { RepuveController } from './repuve.controller';
import { RepuveService } from './repuve.service';

@Module({
  controllers: [RepuveController],
  providers: [RepuveService]
})
export class RepuveModule {}
