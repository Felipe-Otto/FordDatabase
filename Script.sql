CREATE TABLE ford.Fabrica(
    FabricaKey NUMERIC NOT NULL,
    FabricaEndereco STRING(200) NOT NULL,
    PRIMARY KEY(FabricaKey) NOT ENFORCED
);

CREATE TABLE ford.CombustivelQualidade(
    CombustivelQualidadeKey NUMERIC NOT NULL,
    CombustivelQualidadeNome STRING(5) NOT NULL,
    PRIMARY KEY(CombustivelQualidadeKey) NOT ENFORCED
);

CREATE TABLE ford.Combustivel(
    CombustivelKey NUMERIC NOT NULL,
    CombustivelNome STRING(20) NOT NULL,
    PRIMARY KEY(CombustivelKey) NOT ENFORCED
);

CREATE TABLE ford.ModeloVeiculo(
    ModeloVeiculoKey NUMERIC NOT NULL,
    ModeloVeiculoNome STRING(200) NOT NULL,
    PRIMARY KEY(ModeloVeiculoKey) NOT ENFORCED
);

CREATE TABLE ford.TipoVeiculo(
    TipoVeiculoKey NUMERIC NOT NULL,
    TipoVeiculoNome STRING(100) NOT NULL,
    PRIMARY KEY(TipoVeiculoKey) NOT ENFORCED
);

CREATE TABLE ford.Consorcio(
    ConsorcioKey NUMERIC NOT NULL,
    ConsorcioEndereco STRING(200) NOT NULL,
    PRIMARY KEY(ConsorcioKey) NOT ENFORCED
);

CREATE TABLE ford.TipoDocumento(
    TipoDocumentoKey NUMERIC NOT NULL,
    TipoDocumentoNome STRING(100) NOT NULL,
    PRIMARY KEY(TipoDocumentoKey) NOT ENFORCED
);

CREATE TABLE ford.Cor(
    CorKey NUMERIC NOT NULL,
    CorNome STRING(50) NOT NULL,
    PRIMARY KEY(CorKey) NOT ENFORCED
);

CREATE TABLE ford.Documento(
    DocumentoKey NUMERIC NOT NULL,
    ClienteKey NUMERIC NOT NULL,
    TipoDocumentoKey NUMERIC NOT NULL,
    DocumentoNumeracao STRING(14) NOT NULL,
    PRIMARY KEY(DocumentoKey) NOT ENFORCED,
    FOREIGN KEY(ClienteKey) REFERENCES ford.Cliente(ClienteKey) NOT ENFORCED,
    FOREIGN KEY(TipoDocumentoKey) REFERENCES ford.TipoDocumento(TipoDocumentoKey) NOT ENFORCED  
);

CREATE TABLE ford.Veiculo(
    VeiculoKey NUMERIC NOT NULL,
    ModeloVeiculoKey NUMERIC NOT NULL,
    TipoVeiculoKey NUMERIC NOT NULL,
    FabricaKey NUMERIC NOT NULL,
    CorKey NUMERIC NOT NULL,
    VeiculoDataFabricacao DATE NOT NULL,
    VeiculoPlaca STRING(7) NOT NULL,
    VeiculoChassi STRING(17) NOT NULL,
    PRIMARY KEY(VeiculoKey) NOT ENFORCED,
    FOREIGN KEY(ModeloVeiculoKey) REFERENCES ford.ModeloVeiculo(ModeloVeiculoKey) NOT ENFORCED,
    FOREIGN KEY(TipoVeiculoKey) REFERENCES ford.TipoVeiculo(TipoVeiculoKey) NOT ENFORCED,
    FOREIGN KEY(FabricaKey) REFERENCES ford.Fabrica(FabricaKey) NOT ENFORCED,
    FOREIGN KEY(CorKey) REFERENCES ford.Cor(CorKey) NOT ENFORCED    
);

CREATE TABLE ford.Abastecimento(
    AbastecimentoKey NUMERIC NOT NULL,
    VeiculoKey NUMERIC NOT NULL,
    CombustivelKey NUMERIC NOT NULL,
    CombustivelQualidadeKey NUMERIC NOT NULL,
    PRIMARY KEY(AbastecimentoKey) NOT ENFORCED,
    FOREIGN KEY(VeiculoKey) REFERENCES ford.Veiculo(VeiculoKey) NOT ENFORCED,
    FOREIGN KEY(CombustivelKey) REFERENCES ford.Combustivel(CombustivelKey) NOT ENFORCED,
    FOREIGN KEY(CombustivelQualidadeKey) REFERENCES ford.CombustivelQualidade(CombustivelQualidadeKey) NOT ENFORCED  
);

CREATE TABLE ford.Cliente(
    ClienteKey NUMERIC NOT NULL,
    ClienteNome STRING(100) NOT NULL,
    ClienteDataNascimento DATE NOT NULL,
    ClienteTelefone STRING(11) NOT NULL,
    ClienteEmail STRING(256) NOT NULL,
    ClienteEndereco STRING(200) NOT NULL,
    PRIMARY KEY(ClienteKey) NOT ENFORCED   
);

CREATE TABLE ford.Vendedor(
    VendedorKey NUMERIC NOT NULL,
    VendedorNome STRING(100) NOT NULL,
    ConsorcioKey NUMERIC NOT NULL,
    VendedorDataContratacao DATE NOT NULL,
    VendedorTelefone STRING(11) NOT NULL,
    VendedorEmail STRING(256) NOT NULL,
    VendedorEndereco STRING(200) NOT NULL,
    PRIMARY KEY(VendedorKey) NOT ENFORCED,
    FOREIGN KEY(ConsorcioKey) REFERENCES ford.Consorcio(ConsorcioKey) NOT ENFORCED
);

CREATE TABLE ford.Aquisicao(
    AquisicaoKey NUMERIC NOT NULL,
    ClienteKey NUMERIC NOT NULL,
    VeiculoKey NUMERIC NOT NULL,
    ConsorcioKey NUMERIC NOT NULL,
    VendedorKey NUMERIC NOT NULL,
    AquisicaoData DATE NOT NULL,
    PRIMARY KEY(AquisicaoKey) NOT ENFORCED,
    FOREIGN KEY(ClienteKey) REFERENCES ford.Cliente(ClienteKey) NOT ENFORCED,
    FOREIGN KEY(VeiculoKey) REFERENCES ford.Veiculo(VeiculoKey) NOT ENFORCED,
    FOREIGN KEY(ConsorcioKey) REFERENCES ford.Consorcio(ConsorcioKey) NOT ENFORCED,
    FOREIGN KEY(VendedorKey) REFERENCES ford.Vendedor(VendedorKey) NOT ENFORCED
);
