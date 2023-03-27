import { IsNotEmpty, IsString, MinLength } from 'class-validator';

export class CreateUserDTO {
  @IsNotEmpty()
  nombre: string;
  @IsNotEmpty()
  apellidoP: string;
  @IsNotEmpty()
  apellidoM: string;
  @IsNotEmpty()
  password: string;
  @IsNotEmpty()
  numTelefono: string;
  @IsNotEmpty()
  @IsString()
  idUsuario: string;
}

export class LoginDTO {
  @IsNotEmpty()
  @IsString()
  idUsuario: string;

  @IsNotEmpty()
  @IsString({})
  @MinLength(8)
  password: string;
}
