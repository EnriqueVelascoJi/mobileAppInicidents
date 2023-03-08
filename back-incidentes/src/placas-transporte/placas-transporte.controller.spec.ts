import { Test, TestingModule } from '@nestjs/testing';
import { PlacasTransporteController } from './placas-transporte.controller';

describe('PlacasTransporteController', () => {
  let controller: PlacasTransporteController;

  beforeEach(async () => {
    const module: TestingModule = await Test.createTestingModule({
      controllers: [PlacasTransporteController],
    }).compile();

    controller = module.get<PlacasTransporteController>(PlacasTransporteController);
  });

  it('should be defined', () => {
    expect(controller).toBeDefined();
  });
});
