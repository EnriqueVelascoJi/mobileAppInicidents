import { Test, TestingModule } from '@nestjs/testing';
import { RepuveController } from './repuve.controller';

describe('RepuveController', () => {
  let controller: RepuveController;

  beforeEach(async () => {
    const module: TestingModule = await Test.createTestingModule({
      controllers: [RepuveController],
    }).compile();

    controller = module.get<RepuveController>(RepuveController);
  });

  it('should be defined', () => {
    expect(controller).toBeDefined();
  });
});
