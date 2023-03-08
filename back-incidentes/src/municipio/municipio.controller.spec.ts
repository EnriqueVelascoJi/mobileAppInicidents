import { Test, TestingModule } from '@nestjs/testing';
import { MunicipioController } from './municipio.controller';

describe('MunicipioController', () => {
  let controller: MunicipioController;

  beforeEach(async () => {
    const module: TestingModule = await Test.createTestingModule({
      controllers: [MunicipioController],
    }).compile();

    controller = module.get<MunicipioController>(MunicipioController);
  });

  it('should be defined', () => {
    expect(controller).toBeDefined();
  });
});
