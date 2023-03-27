import { Column, Entity, ManyToOne, PrimaryColumn } from 'typeorm';
import { UserEntity } from '../user/user.entity';

@Entity({ name: 'code' })
export class CodeEntity {
  @PrimaryColumn()
  id: string;

  @Column()
  code: string;

  @ManyToOne(() => UserEntity, (user) => user.code, { nullable: false })
  user: UserEntity;
}
