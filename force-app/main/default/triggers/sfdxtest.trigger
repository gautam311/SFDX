trigger sfdxtest on Account (before insert) {
    System.debug('test for SFDX');
}