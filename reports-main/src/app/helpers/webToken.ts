import { sign, verify } from 'jsonwebtoken';

export const createToken = (body: any) => {
  return sign({ ...body }, process.env.JWT_KEY);
};

export const verifyToken = (token: string) => {
  return verify(token, process.env.JWT_KEY);
};
