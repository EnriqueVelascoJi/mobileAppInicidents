import { Repository } from 'typeorm';
import { InjectRepository } from '@nestjs/typeorm';
import { HttpException, HttpStatus, Injectable } from '@nestjs/common';
import { encrypt, verifyText } from '../helpers/encriptacion';
import { createToken } from '../helpers/webToken';
import { CreateUserDTO } from './user.type';
import { UserEntity } from './user.entity';

@Injectable()
export class UserService {
  constructor(
    @InjectRepository(UserEntity)
    private userRepository: Repository<UserEntity>,
  ) {}

  async createuser(userInformation: CreateUserDTO): Promise<void> {
    const { password } = userInformation;
    const encryptedPassword = await encrypt(password);
    const entriesInformation = Object.entries(userInformation);
    const user = this.userRepository.create({});
    entriesInformation.forEach(([field, value]) => {
      user[field] = value;
    });
    user.password = encryptedPassword;
    await this.userRepository.save(user);
  }

  async getUserById(userId: string): Promise<UserEntity> {
    return await this.userRepository.findOne({ where: { idUsuario: userId } });
  }

  async loginUser(
    userId: string,
    password: string,
  ): Promise<{ token: string }> {
    const user = await this.getUserById(userId);
    if (!user) throw new HttpException('User not found', HttpStatus.NOT_FOUND);
    const verifiedPassword = await verifyText(password, user.password);
    if (!verifiedPassword)
      throw new HttpException('Invalid request', HttpStatus.UNAUTHORIZED);
    const token = createToken({ idUsuario: user.idUsuario });
    return { token };
  }

  async changePassword(user: UserEntity, newPassword: string) {
    const encryptedPassword = await encrypt(newPassword);
    user.password = encryptedPassword;
    return await this.userRepository.save(user);
  }
}
