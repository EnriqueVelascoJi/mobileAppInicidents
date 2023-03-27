import { hash, genSalt, compare } from 'bcrypt';

export const encrypt = async (text: string): Promise<string> => {
  const salt = await genSalt(10);
  return await hash(text, salt);
};

export const verifyText = async (
  text: string,
  encryptedText: string,
): Promise<boolean> => {
  return await compare(text, encryptedText);
};
