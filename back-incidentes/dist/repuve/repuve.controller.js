"use strict";
var __decorate = (this && this.__decorate) || function (decorators, target, key, desc) {
    var c = arguments.length, r = c < 3 ? target : desc === null ? desc = Object.getOwnPropertyDescriptor(target, key) : desc, d;
    if (typeof Reflect === "object" && typeof Reflect.decorate === "function") r = Reflect.decorate(decorators, target, key, desc);
    else for (var i = decorators.length - 1; i >= 0; i--) if (d = decorators[i]) r = (c < 3 ? d(r) : c > 3 ? d(target, key, r) : d(target, key)) || r;
    return c > 3 && r && Object.defineProperty(target, key, r), r;
};
var __metadata = (this && this.__metadata) || function (k, v) {
    if (typeof Reflect === "object" && typeof Reflect.metadata === "function") return Reflect.metadata(k, v);
};
var __param = (this && this.__param) || function (paramIndex, decorator) {
    return function (target, key) { decorator(target, key, paramIndex); }
};
Object.defineProperty(exports, "__esModule", { value: true });
exports.RepuveController = void 0;
const common_1 = require("@nestjs/common");
const repuve_service_1 = require("./repuve.service");
let RepuveController = class RepuveController {
    constructor(repuveService) {
        this.repuveService = repuveService;
    }
    searchByPlate(plate) {
        return this.repuveService.searchByPlate(plate);
    }
};
__decorate([
    (0, common_1.Get)(':plate'),
    __param(0, (0, common_1.Param)('plate')),
    __metadata("design:type", Function),
    __metadata("design:paramtypes", [String]),
    __metadata("design:returntype", void 0)
], RepuveController.prototype, "searchByPlate", null);
RepuveController = __decorate([
    (0, common_1.Controller)('repuve'),
    __metadata("design:paramtypes", [repuve_service_1.RepuveService])
], RepuveController);
exports.RepuveController = RepuveController;
//# sourceMappingURL=repuve.controller.js.map