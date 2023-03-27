export const getGoodResponse = ({
  message = 'Ok',
  status = 0,
  payload = {},
}) => {
  return { message, status, payload };
};
