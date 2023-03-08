import { Test, TestingModule } from '@nestjs/testing';
import { IncidenteVialController } from './incidente-vial.controller';

describe('IncidenteVialController', () => {
  let controller: IncidenteVialController;

  beforeEach(async () => {
    const module: TestingModule = await Test.createTestingModule({
      controllers: [IncidenteVialController],
    }).compile();

    controller = module.get<IncidenteVialController>(IncidenteVialController);
  });

  it('should be defined', () => {
    expect(controller).toBeDefined();
  });
});
