-- Cria a entidade f_cs16
ENT.Type = "anim"
ENT.Base = "base_anim"
ENT.PrintName = "Entidade CS16"
ENT.Author = "Xp1"
ENT.Category = "Categoria"

-- Configurações da entidade
function ENT:Initialize()
    if SERVER then
        self:SetModel("models/props_cs16/p_cs16.mdl") -- Modelo da entidade
        self:PhysicsInit(SOLID_VPHYSICS) -- Inicialização da física
        self:SetMoveType(MOVETYPE_VPHYSICS) -- Tipo de movimento
        self:SetSolid(SOLID_VPHYSICS) -- Tipo de colisão
        self:SetUseType(SIMPLE_USE) -- Tipo de uso
    end
end

-- Chamado quando a entidade é usado
function ENT:Use(activator, caller)
    -- Adicione a lógica para o uso da entidade aqui
    -- Por exemplo, pode exibir uma mensagem para o jogador ou realizar uma ação específica
end

-- Chamado quando a entidade é removido
function ENT:OnRemove()
    -- Adicione qualquer lógica de limpeza necessária aqui
end

-- Registrando a entidade no sistema
if CLIENT then
    language.Add("f_cs16", "Entidade CS16") -- Adiciona a tradução do nome da entidade
end