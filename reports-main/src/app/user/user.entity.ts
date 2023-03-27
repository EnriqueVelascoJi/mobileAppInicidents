import { v4 as uuidv4 } from 'uuid';
import { Entity, Column, PrimaryColumn, OneToMany } from 'typeorm';
import { CodeEntity } from '../codes/codes.entity';
import { AdministratorEntity } from '../administrator/administrator.entity';
import { AgentEntity } from '../agent/agent.entity';

@Entity({ name: 'user' })
export class UserEntity {
  @PrimaryColumn({ default: uuidv4() })
  idUsuario: string;

  @Column()
  nombre: string;

  @Column()
  apellidoP: string;

  @Column()
  apellidoM: string;

  @Column()
  password: string;

  @Column()
  numTelefono: string;

  @Column({ default: true })
  estatus: boolean;

  @OneToMany(() => CodeEntity, (code) => code.user)
  code: CodeEntity[];

  @OneToMany(() => AdministratorEntity, (administrator) => administrator.user)
  administrator: AdministratorEntity[];

  @OneToMany(() => AgentEntity, (agent) => agent.user)
  agent: AgentEntity[];
}
