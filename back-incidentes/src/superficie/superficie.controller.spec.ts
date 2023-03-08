import { Test, TestingModule } from '@nestjs/testing';
import { SuperficieController } from './superficie.controller';

describe('SuperficieController', () => {
  let controller: SuperficieController;

  beforeEach(async () => {
    const module: TestingModule = await Test.createTestingModule({
      controllers: [SuperficieController],
    }).compile();

    controller = module.get<SuperficieController>(SuperficieController);
  });

  it('should be defined', () => {
    expect(controller).toBeDefined();
  });
});
