import { Controller, Get, Param } from '@nestjs/common';
import { RepuveService } from './repuve.service';

@Controller('repuve')
export class RepuveController {
  constructor(private readonly repuveService: RepuveService) {}

  @Get(':plate')
  searchByPlate(@Param('plate') plate: string) {
    //return this.repuveService.searchByPlate(plate);
  }
}