import { Test, TestingModule } from '@nestjs/testing';
import { InvolucradosController } from './involucrados.controller';

describe('InvolucradosController', () => {
  let controller: InvolucradosController;

  beforeEach(async () => {
    const module: TestingModule = await Test.createTestingModule({
      controllers: [InvolucradosController],
    }).compile();

    controller = module.get<InvolucradosController>(InvolucradosController);
  });

  it('should be defined', () => {
    expect(controller).toBeDefined();
  });
});
