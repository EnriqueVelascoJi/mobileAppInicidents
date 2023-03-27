import { IsNotEmpty, IsString, MinLength } from 'class-validator';

export class CodeDTO {
  @IsNotEmpty()
  @IsString()
  idUsuario: string;
}

export class RestorePasswordDTO {
  @IsNotEmpty()
  @IsString()
  idUsuario: string;

  @IsNotEmpty()
  @IsString()
  code: string;

  @IsNotEmpty()
  @IsString()
  @MinLength(8)
  newPassword: string;
}
