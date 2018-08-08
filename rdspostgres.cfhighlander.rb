CfhighlanderTemplate do
  DependsOn 'vpc@1.2.0'
  Parameters do
    ComponentParam 'VPCId', type: 'AWS::EC2::VPC::Id'
    ComponentParam 'StackOctet', isGlobal: true
    ComponentParam 'RDSSnapshotID'
    ComponentParam 'MultiAZ', 'false', allowedValues: ['true','false']
    ComponentParam 'EnvironmentName', 'dev', isGlobal: true
    ComponentParam 'EnvironmentType', 'development', isGlobal: true, allowedValues: ['development', 'production']
    ComponentParam 'RDSInstanceType'
    ComponentParam 'RDSAllocatedStorage'
    MappingParam('DnsDomain') do
      map 'AccountId'
      attribute 'DnsDomain'
    end

    maximum_availability_zones.times do |az|
      ComponentParam "SubnetPersistence#{az}"
    end
  end
end
