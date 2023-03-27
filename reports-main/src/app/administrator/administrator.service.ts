import { Repository } from 'typeorm';
import { Injectable } from '@nestjs/common';
import { InjectRepository } from '@nestjs/typeorm';
import { AdministratorEntity } from './administrator.entity';
import { UserEntity } from '../user/user.entity';

@Injectable()
export class AdministratorService {
  constructor(
    @InjectRepository(AdministratorEntity)
    private administratorRepository: Repository<AdministratorEntity>,
  ) {}

  async getAdminByUserid(user: UserEntity): Promise<AdministratorEntity> {
    return await this.administratorRepository.findOne({ where: { user } });
  }
}
