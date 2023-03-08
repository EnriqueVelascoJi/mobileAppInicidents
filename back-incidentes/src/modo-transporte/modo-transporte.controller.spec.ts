import { Test, TestingModule } from '@nestjs/testing';
import { ModoTransporteController } from './modo-transporte.controller';

describe('ModoTransporteController', () => {
  let controller: ModoTransporteController;

  beforeEach(async () => {
    const module: TestingModule = await Test.createTestingModule({
      controllers: [ModoTransporteController],
    }).compile();

    controller = module.get<ModoTransporteController>(ModoTransporteController);
  });

  it('should be defined', () => {
    expect(controller).toBeDefined();
  });
});
