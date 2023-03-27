import {
  Put,
  Body,
  Post,
  UsePipes,
  Controller,
  ValidationPipe,
} from '@nestjs/common';
import { CreateUserDTO, LoginDTO } from './user.type';
import { getGoodResponse } from '../helpers/reponses';
import { UserService } from './user.service';

@Controller('user')
export class UserController {
  constructor(private readonly userService: UserService) {}

  @Post('/')
  @UsePipes(new ValidationPipe({ transform: true }))
  async createUser(@Body() createUser: CreateUserDTO) {
    await this.userService.createuser(createUser);
    return getGoodResponse({});
  }

  @Put('/login')
  @UsePipes(new ValidationPipe({ transform: true }))
  async login(@Body() loginData: LoginDTO) {
    const { idUsuario, password } = loginData;
    const response = await this.userService.loginUser(idUsuario, password);
    return getGoodResponse({ payload: response });
  }
}
