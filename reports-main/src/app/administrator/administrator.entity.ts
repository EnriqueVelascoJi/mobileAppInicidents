import { Entity, ManyToOne, PrimaryColumn } from 'typeorm';
import { UserEntity } from '../user/user.entity';

@Entity({ name: 'administrador' })
export class AdministratorEntity {
  @PrimaryColumn()
  numeroAdmin: string;

  @ManyToOne(() => UserEntity, (user) => user.administrator, {
    nullable: false,
  })
  user: UserEntity;
}
