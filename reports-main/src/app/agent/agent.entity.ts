import { Entity, ManyToOne, PrimaryColumn } from 'typeorm';
import { UserEntity } from '../user/user.entity';

@Entity({ name: 'agente' })
export class AgentEntity {
  @PrimaryColumn()
  numeroAgente: string;

  @ManyToOne(() => UserEntity, (user) => user.agent)
  user: UserEntity;
}
