import { Test, TestingModule } from '@nestjs/testing';
import { UbicacionController } from './ubicacion.controller';

describe('UbicacionController', () => {
  let controller: UbicacionController;

  beforeEach(async () => {
    const module: TestingModule = await Test.createTestingModule({
      controllers: [UbicacionController],
    }).compile();

    controller = module.get<UbicacionController>(UbicacionController);
  });

  it('should be defined', () => {
    expect(controller).toBeDefined();
  });
});
