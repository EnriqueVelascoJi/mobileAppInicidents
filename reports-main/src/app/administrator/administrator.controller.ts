import {
  Controller,
  HttpException,
  HttpStatus,
  Param,
  Post,
} from '@nestjs/common';
import { UserService } from '../user/user.service';
import { AdministratorService } from './administrator.service';

@Controller('administrator')
export class AdministratorController {
  constructor(
    private readonly administratorService: AdministratorService,
    private readonly userService: UserService,
  ) {}

  @Post('/:userId')
  async createAdministrator(@Param('userId') userId: string) {
    console.log(userId);
    const user = await this.userService.getUserById(userId);
    if (!user) throw new HttpException('User not found', HttpStatus.NOT_FOUND);
    const administrator = await this.administratorService.getAdminByUserid(
      user,
    );
    if (administrator)
      throw new HttpException('Admin already exists', HttpStatus.CONFLICT);
      
  }
}
