import {
  Body,
  Controller,
  Put,
  HttpException,
  UsePipes,
  ValidationPipe,
  HttpStatus,
} from '@nestjs/common';
import { getGoodResponse } from '../helpers/reponses';
import { UserService } from '../user/user.service';
import { CodesService } from './codes.service';
import { CodeDTO, RestorePasswordDTO } from './code.type';

@Controller('codes')
export class CodesController {
  constructor(
    private readonly codesService: CodesService,
    private readonly userService: UserService,
  ) {}

  @Put('/password/code')
  @UsePipes(new ValidationPipe({ transform: true }))
  async getRestoreCode(@Body() userCode: CodeDTO) {
    const { idUsuario } = userCode;
    const user = await this.userService.getUserById(idUsuario);
    if (!user) throw new HttpException('User not found', HttpStatus.NOT_FOUND);
    await this.codesService.createNewCode(user);
    return getGoodResponse({});
  }

  @Put('/password/restore')
  @UsePipes(new ValidationPipe({ transform: true }))
  async restorePassword(@Body() restoreData: RestorePasswordDTO) {
    const { code, idUsuario, newPassword } = restoreData;
    const user = await this.userService.getUserById(idUsuario);
    if (!user) throw new HttpException('User not found', HttpStatus.NOT_FOUND);
    await this.codesService.restorePassword(user, { code, newPassword });
    return getGoodResponse({ message: 'Password changed' });
  }
}
