import { Test, TestingModule } from '@nestjs/testing';
import { LocalidadController } from './localidad.controller';

describe('LocalidadController', () => {
  let controller: LocalidadController;

  beforeEach(async () => {
    const module: TestingModule = await Test.createTestingModule({
      controllers: [LocalidadController],
    }).compile();

    controller = module.get<LocalidadController>(LocalidadController);
  });

  it('should be defined', () => {
    expect(controller).toBeDefined();
  });
});
