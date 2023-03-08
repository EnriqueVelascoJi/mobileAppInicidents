import { Test, TestingModule } from '@nestjs/testing';
import { TipoIncidenteController } from './tipo-incidente.controller';

describe('TipoIncidenteController', () => {
  let controller: TipoIncidenteController;

  beforeEach(async () => {
    const module: TestingModule = await Test.createTestingModule({
      controllers: [TipoIncidenteController],
    }).compile();

    controller = module.get<TipoIncidenteController>(TipoIncidenteController);
  });

  it('should be defined', () => {
    expect(controller).toBeDefined();
  });
});
