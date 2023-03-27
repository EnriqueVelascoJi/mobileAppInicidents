import { v4 as uuidv4 } from 'uuid';
import { Repository } from 'typeorm';
import { HttpException, HttpStatus, Injectable } from '@nestjs/common';
import { InjectRepository } from '@nestjs/typeorm';
import { sendMessage } from 'src/helpers/TextMessage';
import { UserEntity } from '../user/user.entity';
import { CodeEntity } from './codes.entity';
// import { UserService } from '../user/user.service';

@Injectable()
export class CodesService {
  constructor(
    @InjectRepository(CodeEntity)
    private codeRepository: Repository<CodeEntity>, // private userService: UserService,
  ) {}

  async createNewCode(user: UserEntity) {
    const doesCodeExist = await this.codeRepository.findOne({
      where: { user },
    });
    if (doesCodeExist) await this.codeRepository.remove(doesCodeExist);
    const code = await this.getTextCode(user.numTelefono);
    const codeInstance = this.codeRepository.create({
      code,
      id: uuidv4(),
      user,
    });
    this.codeRepository.save(codeInstance);
  }

  async getTextCode(numTelefono: string) {
    return await sendMessage(numTelefono);
  }

  async restorePassword(
    user: UserEntity,
    { code, newPassword }: { code: string; newPassword: string },
  ) {
    const codeInstance = await this.codeRepository.findOne({
      where: { user, code },
    });
    if (!codeInstance)
      throw new HttpException('User not found', HttpStatus.NOT_FOUND);
    // await this.userService.changePassword(user, newPassword);
  }
}
